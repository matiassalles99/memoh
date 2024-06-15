# Memoh - SSH Connections

If you're tired of remembering IPs, hostnames, passwords, and identity files for your SSH connections, then you'll probably find Memoh useful.

Memoh is a lightweight tool that allows you to save configurations for each of your SSH connections. It's similar to [Termius](https://termius.com/) but runs in your terminal as a cli instead of a separate application.


https://github.com/matiassalles99/memoh/assets/57004457/512f112b-f4c5-4da4-870e-006876e3237c


## Installation

- If you want to install it using bundler directly, then use:
    
```bash
  gem install memoh
```

- Brew will be available shortly

## Usage

- List all commands:

```bash
  memoh
  # memoh connect         # Connect to host using SSH by memo name. Example: memoh connect my_server
  # memoh create          # Create a new SSH memo
  # memoh delete          # Delete a memo by name
  # memoh details         # Display all the details of a memo by name
  # memoh health          # Checks the health of each SSH memo
  # memoh help [COMMAND]  # Describe available commands or one specific command
  # memoh list            # List all SSH memos
  # memoh update          # Update a memo by name
  # memoh version         # Display Memoh version
```

- List all saved configurations:

```bash
  memoh list
  # Will print:
  # Name: connection_name_1, Host: ip_1
  # Name: connection_name_2, Host: ip_2
```

- Connect to one of them:

```bash
  memoh connect connection_name_1
```

- Add a new configuration:

```bash
  memoh create
  # -> Enter the IP address or hostname: 
  # -> Enter the username:
  # -> Enter the path to the SSH key used for this host: (could be a path to an identity file eg: ~/Desktop/Credentials/my_key.pem, or a generic SSH key that is registered in your host, eg: ~/.ssh/id_rsa)
  # -> Choose a name for your SSH memo (you'll use this name to connect to your host):
  # -> Choose a color for your SSH memo:
```

- You can also update the configuration of an existing memo

```bash
  memoh update connection_name_1
  # Will be prompted for the same questions as in the create command
```

- Delete a configuration:

```bash
  memoh delete connection_name_1
```

- See all details for a specific configuration:

```bash
  memoh details connection_name_1
```
