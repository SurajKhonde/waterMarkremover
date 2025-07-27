# 🎥 Watermark Remover (Dockerized Node.js + FFmpeg)

A simple, Docker-based tool to remove center-positioned watermarks from `.mp4` videos using FFmpeg's `delogo` filter. No need to install Node.js or FFmpeg on your local machine — just use Docker.

---

## 📦 Download the Bundle

Download the prebuilt Docker image and run script:

👉 **[https://drive.google.com/file/d/1dFvjEmCOgzASBgf_EGaH1eZ3ahqF00dL/view?usp=sharing](#)**  
<!-- Replace # with actual link -->

This bundle contains:
- `watermark-remover.tar` – Docker image of the app
- `run_watermark_remover.sh` – Shell script to load and run the image

---

## 🖥️ Requirements

- Docker installed on your system
- Bash (for running `.sh` script)
- Input videos in `.mp4` format (with watermark in center of frame)

---

## 📥 How to Use

### 1. Extract the Bundle

```bash
tar -xzvf watermark-remover-bundle.tar.gz
```
### 2. Make the Script Executable
```bash
chmod +x run_watermark_remover.sh
```
### 3. Run the Watermark Remover
```bash
./run_watermark_remover.sh watermark-remover.tar /full/path/to/input /full/path/to/output

```
 #### 📁 Project Structure
```bash
watermarkRemover/
├── Dockerfile
├── index.js
├── run_watermark_remover.sh
├── create_bundle.sh
├── watermark-remover.tar
├── watermark-remover-bundle.tar.gz
├── source/         # Place input .mp4 videos here
└── output/         # Output videos will be saved here
```
