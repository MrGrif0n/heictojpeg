from pillow_heif import open_heif
from PIL import Image
import os
import sys

def convert_heic_to_jpeg(input_path, output_path):
    try:
        heif_image = open_heif(input_path)
        image = Image.frombytes(heif_image.mode, heif_image.size, heif_image.data)
        image.save(output_path, "JPEG")
        print(f"Converted {input_path} -> {output_path}")
    except Exception as e:
        print(f"Error converting {input_path}: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: heictopng file1 [file2 ...] [output_folder]")
        sys.exit(1)

    args = sys.argv[1:]
    output_folder = "jpeg_output"

    if len(args) > 1 and not args[-1].lower().endswith(".heic"):
        output_folder = args[-1]
        input_files = args[:-1]
    else:
        input_files = args

    if os.path.exists(output_folder):
        print(f"Error: Output folder '{output_folder}' already exists.")
        sys.exit(1)

    os.makedirs(output_folder)
    print(f"Created output folder: {output_folder}")

    for file in input_files:
        if not os.path.isfile(file) or not file.lower().endswith(".heic"):
            print(f"Skipping '{file}': Not a valid HEIC file.")
            continue
        
        output_file = os.path.join(output_folder, os.path.splitext(os.path.basename(file))[0] + ".jpeg")
        convert_heic_to_jpeg(file, output_file)
