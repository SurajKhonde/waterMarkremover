const ffmpeg = require('fluent-ffmpeg');
const fs = require('fs');
const path = require('path');

const sourceDir = path.join(__dirname, 'source');
const outputDir = path.join(__dirname, 'output');

// Approximate watermark size in center
const watermarkWidth = 200;
const watermarkHeight = 100;

fs.readdir(sourceDir, (err, files) => {
  if (err) {
    return console.error('Error reading source directory:', err);
  }

  files.filter(f => f.endsWith('.mp4')).forEach(file => {
    const inputPath = path.join(sourceDir, file);
    const outputPath = path.join(outputDir, `out_${file}`);

    ffmpeg.ffprobe(inputPath, (err, metadata) => {
      if (err) return console.error('FFprobe error:', err);

      const stream = metadata.streams.find(s => s.width && s.height);
      const x = Math.floor((stream.width - watermarkWidth) / 2);
      const y = Math.floor((stream.height - watermarkHeight) / 2);

      ffmpeg(inputPath)
        .videoFilter(`delogo=x=${x}:y=${y}:w=${watermarkWidth}:h=${watermarkHeight}`)
        .output(outputPath)
        .on('end', () => console.log(`Processed: ${file}`))
        .on('error', err => console.error(`Error processing ${file}:`, err.message))
        .run();
    });
  });
});
