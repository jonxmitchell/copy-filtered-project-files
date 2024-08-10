# 📂 ProjectSift

ProjectSift is a simple and efficient tool to selectively copy essential files from a project directory while excluding unnecessary folders like `node_modules` and/or files like `app.log`, build directories, and lock files. Perfect for streamlining your project backups or sharing a clean version of your codebase.

# ✨ Features

- 🗂️ Selective Copying: Only copies the files you want, leaving out unnecessary files and folders.
- 🧹 Clean Project Transfer: Ideal for creating clean, shareable versions of your project.
- ⚡ Quick Setup: Easy to configure with a customizable list of exclusions.

# 🛠️ Usage

1. Edit the Exclusion Lists:

   - Modify the exclusion lists in `CopyFilteredProjectFiles.ps1` to suit your needs.
   - You can exclude folders like `node_modules`, `build` and files like `package-lock.json`, `.log` files, etc.

2. Run the Batch Script:

   - Double-click `RunCopyFilteredProjectFiles.bat` to execute the PowerShell script and copy the filtered files.

3. Check the Destination:
   - The filtered files will be copied to the specified destination directory, ready for use or sharing.

# 📁 Directory Structure

```bash
Copy code
├── CopyFilteredProjectFiles.ps1  # PowerShell script for filtering and copying files
├── RunCopyFilteredProjectFiles.bat  # Batch script to run the PowerShell script
├── README.md  # Project documentation
```

# ⚙️ Customization

- Source Directory: Update the $rootDirectory variable in `CopyFilteredProjectFiles.ps1` to point to your project directory.
- Destination Directory: Change the $destinationDirectory variable to set where the filtered files should be copied.
- Exclusion Lists: Adjust the $excludedFolders and `$excludedFiles` arrays to exclude additional files or folders.

# 🚀 Getting Started

1. Clone this repository to your local machine.
2. Edit the PowerShell script as needed.
3. Run the batch script to filter and copy your project files.

# 🤝 Contributing

Feel free to submit issues or pull requests if you have ideas for improvement or find any bugs!

# 📝 License

This project is open-source and available under the MIT License.
