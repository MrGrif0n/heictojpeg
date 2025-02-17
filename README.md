# heictojpeg

heictojpeg is a simple command-line utility written in Python for converting HEIC images to JPEG format. This project includes an installation script (`install.sh`) that sets up a Python virtual environment, installs the required packages, and configures an alias so you can easily run the tool from your terminal.

## Features

- **Simple Conversion:** Convert one or more HEIC files into JPEG format.
- **Automatic Output Handling:**  
  - If no output directory is specified, a new folder named `jpeg_output` is created in the current directory to save the converted images.
  - If the `jpeg_output` folder already exists, the script throws an error to prevent accidental overwriting.
- **Virtual Environment Setup:** Automatically creates and manages a Python virtual environment (`myenv`) with all required dependencies.

## Installation

To install heictojpeg, run the provided installation script:

1. **Make the installation script executable:**

   ```bash
   chmod +x install.sh
   ```

2. **Run the installation script:**

   ```bash
   ./install.sh
   ```

The script will:
- Create a Python virtual environment (`myenv`) in the project directory (if it doesn't already exist).
- Upgrade pip and install the required Python packages listed in `requirements.txt` (Pillow and pillow-heif).
- Add an alias for the `heictojpeg` command to your shell configuration file (e.g., `~/.bashrc` or `~/.zshrc`).

After installation, restart your terminal or run the appropriate command to load the new alias:

```bash
source ~/.bashrc
# or
source ~/.zshrc
```

## Usage

Once installed, you can convert HEIC images to JPEG using the following command:

```bash
heictojpeg <file1> [file2 ...] [output_directory]
```

### Examples

- **Converting a Single HEIC File (no output directory specified):**

  ```bash
  heictojpeg image.heic
  ```

  This command converts `image.heic` and saves the resulting JPEG image in a newly created `jpeg_output` folder.

- **Converting Multiple HEIC Files with a Specified Output Directory:**

  ```bash
  heictojpeg file1.heic file2.heic /path/to/output
  ```

  This command converts both `file1.heic` and `file2.heic`, placing the resulting JPEG images in `/path/to/output`.

## Requirements

- **Operating System:** Unix-like (Linux, macOS, etc.)
- **Python:** Python 3 (with the `venv` module enabled)

The required Python packages are automatically installed by the installation script:
- [Pillow](https://pillow.readthedocs.io/)
- [pillow-heif](https://github.com/bonson/pillow-heif)

## Project Structure

```
heictojpeg/          # Project directory
├── heictojpeg       # Bash wrapper script for running the Python conversion script
├── heictojpeg.py    # Main Python script that performs the conversion
├── install.sh       # Installation script to set up the environment and alias
├── README.md        # This README file
└── requirements.txt # Python dependencies (Pillow, pillow-heif)
```

## Contributing

Contributions are welcome! Feel free to fork the repository and submit pull requests with your improvements or bug fixes.

## Support

If you have any questions or encounter any issues, please open an issue in the repository.
