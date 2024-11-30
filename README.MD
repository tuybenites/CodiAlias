# 🚀 CodiAlias

**CodiAlias** is a simple solution to address compatibility issues between [VSCodium](https://vscodium.com/) and extensions relying on hard-coded Visual Studio Code commands (like `code`).

## ✨ Features

This project copies scripts into the VSCodium commands directory, enabling `code` commands (native to VSCode) to work seamlessly within the VSCodium environment. This eliminates compatibility breaks caused by poorly implemented extensions.

## 📋 Requirements

- **Operating System**: Windows only.
- **Permissions**: The script **must be run as an administrator** to perform the required changes successfully.

## 🚨 Important Note

Running this script may cause **compatibility issues** if you already have Visual Studio Code (VSCode) installed on your system.  
The `code` command for VSCode will be overridden by this script, potentially affecting your existing setup.  
Please proceed only if you are aware of these implications and are comfortable with the changes.

## 🖥️ How to Use

1. Clone this repository to your local machine:
   ```powershell
   git clone "https://github.com/tuybenites/CodiAlias.git"

2. Navigate to the project directory:
    ```powershell
    cd CodiAlias

3. Run the script with administrative privileges:
    - For default configuration:
        ```powershell
        .\Codi-Alias -default

    - To specify a custom path:
        ```powershell
        .\Codi-Alias "C:\desired\path\"

### 🤝 Contribution

If you'd like to contribute to this project, feel free to submit a pull request or report issues in the [issues tab](https://github.com/tuybenites/CodiAlias/issues).

#### Made with ❤️ for the developer community using VSCodium.