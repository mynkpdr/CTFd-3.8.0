# CTFD-Attempts-Viewer

**CTFD-Attempts-Viewer** is a plugin for [CTFd](https://ctfd.io) that allows users to view their submission attempts for specific challenges.

---

## Main Features

- **Team attempt consultation** :
  - Players can view all attempts submitted by their team, challenge by challenge (TEAM MODE CTFd).
- **Individual attempt consultation** :
  - Players can view all their submitted attempts, challenge by challenge (USER MODE CTFd).
- **New "Attempts" tab in each challenge** :
  - Directly from a challenge modal, the team can see the complete submission history for that challenge.
- **Dedicated global history page** :
  - A central page to explore all attempts made during the event, with advanced filters (player, challenge, status).
- **Simple admin configuration** :
  - Enable/disable the main button on the Challenges page directly from the admin panel.

## Why this plugin?

> "How many times did I submit this flag? Who tried it? What was my last attempt?"

With this plugin, each player can finally track their attempts autonomously, without bothering the organization.  
They have a clear and detailed view of their submissions, whether challenge by challenge or across the entire event.

From an administration perspective, no more need to respond to repetitive requests about attempt history.  
Teams gain autonomy, and the organization gains comfort and time.

Thanks to this plugin, everyone stays focused on the game and progression, without distractions.

## Installation

1. Clone this repository into the `CTFd/plugins` folder:

   ```bash
   cd /path/to/CTFd/plugins
   git clone https://github.com/HACK-OLYTE/CTFD-Attempts-Viewer.git

   ```

2. Restart your CTFd instance to load the plugin.

## Configuration

Access the admin panel **Plugins > Attempts-Viewer** to:

- Enable or disable the "Your attempts history" button on the challenges page (button to view all submissions).

Here's a demonstration video of the plugin:

https://github.com/user-attachments/assets/293011ee-3942-4d98-a4ef-39c04a18a298

## Dependencies

- CTFd ≥ v3.x
- Compatible with Docker and local installations.
- An up-to-date browser with JavaScript enabled.
- CTFd theme: Core-beta

## Support

For any questions or issues, open an [issue](https://github.com/votre-utilisateur/CTFD-Attempts-Viewer/issues). <br>
Or contact us on the Hack'olyte association website: [contact](https://hackolyte.fr/contact/).

## Contributing

Contributions are welcome!  
You can:

- Report bugs
- Suggest new features
- Submit pull requests

## License

This plugin is under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed.fr) license.  
Please do not remove the footer from each HTML file without prior authorization from the Hack'olyte association.
