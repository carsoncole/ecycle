# Scout E-Cycle

This is a Ruby on Rails application for hosting a Scout E-Cycle event, with the following features:

- Acceptance of donations
- Sign-ups for pickups
- Allocation of specific drivers to handling pickups

## Installation

- Bundle install

Edit the /app/views/home/about.haml page with information about your event.

- rails server

## Requirements

Ecycle requires Ruby on Rails >= 5.2 and Ruby >= 2.1.

### Credentials

This using Encrypted Credentials which are stored in an encrypted file "credentials.yml.enc". Decrypting this file is done with a master.key file, which is not stored in the repository. The master.key file should be manually uploaded to wherever this application is hosted. To start fresh, delete the existing credentials file.