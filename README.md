# CTFd 3.8.0 - Enhanced Edition

A production-ready, modded version of [CTFd 3.8.0](https://github.com/CTFd/CTFd) with enhanced plugins and themes for a superior Capture The Flag competition experience.

## 🚀 Features

### Base Platform
- **CTFd Version**: 3.8.0 (Latest)
- **Production Ready**: All configurations optimized for production deployment
- **Enhanced Compatibility**: Custom modifications ensure all plugins work seamlessly with the latest CTFd version

### 🎨 Available Themes

#### **Pixo** (Default Theme)
- **Retro-styled theme** with 90s CRT aesthetics
- Features old-school fonts, screen flicker effects, and vintage notification sounds
- Perfect for themed competitions or retro-style events
- Enhanced for CTFd 3.8.0 compatibility

#### **Core**
- Standard CTFd theme with modern, clean interface
- Fully responsive design
- Professional appearance for corporate events

#### **Core-Deprecated** 
- Legacy theme option for backward compatibility

### 🔌 Enhanced Plugins

#### **Attempts Viewer**
- **Team Attempt History**: View all submission attempts by team members
- **Individual Tracking**: Personal submission history for each player
- **Challenge-Specific Views**: See attempts directly from challenge modals
- **Global History Page**: Centralized view with advanced filtering
- **Admin Controls**: Enable/disable features from admin panel
- **Autonomous Tracking**: Reduces admin workload by letting teams self-serve

#### **Containers Plugin**
- **Ephemeral Docker Containers**: Spin up isolated lab environments per team
- **Dynamic Container Management**: Automatic lifecycle management
- **SSH/Local Socket Support**: Flexible connection options
- **Advanced Configuration**: Custom volumes, networking, and resource limits
- **Team Isolation**: Separate containerized environments for each team
- **Challenge Integration**: Seamless integration with container-based challenges

### 🔧 Technical Enhancements
- **Cross-compatibility fixes** for all themes and plugins with CTFd 3.8.0
- **Performance optimizations** for production environments
- **Security hardening** and stability improvements
- **Enhanced error handling** and logging

## � Docker Hub

**Pre-built Docker Image**: [`mynkpdr/ctfd`](https://hub.docker.com/r/mynkpdr/ctfd)

Pull and deploy instantly:
```bash
docker pull mynkpdr/ctfd:latest
docker run -d -p 8000:8000 mynkpdr/ctfd:latest
```

Available tags:
- `latest` - Production-ready stable release

For comprehensive Docker deployment instructions, environment variables, and production configurations, see **[DOCKER_OVERVIEW.md](DOCKER_OVERVIEW.md)**.

## �📋 Requirements

- **Python**: 3.8+
- **Docker**: For containerized deployment
- **Database**: MySQL/MariaDB or PostgreSQL (recommended for production)
- **Web Server**: Nginx (configuration included)

## 🚀 Quick Start

### Docker Hub Deployment (Recommended)

**Using our pre-built Docker image:**

```bash
# Quick start with Docker
docker pull mynkpdr/ctfd:latest
docker run -d -p 8000:8000 --name ctfd mynkpdr/ctfd:latest
```

**Full production setup with Docker Compose:**
```yaml
version: '3.8'
services:
  ctfd:
    image: mynkpdr/ctfd:latest
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=mysql://ctfd:password@db/ctfd
      - SECRET_KEY=your-secret-key-here
    depends_on:
      - db
    restart: unless-stopped
    
  db:
    image: mariadb:10.6
    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_DATABASE=ctfd
      - MYSQL_USER=ctfd
      - MYSQL_PASSWORD=password
    volumes:
      - db_data:/var/lib/mysql
    restart: unless-stopped

volumes:
  db_data:
```

📋 **For complete Docker deployment guide, see [DOCKER_OVERVIEW.md](DOCKER_OVERVIEW.md)**

### Building from Source

1. **Clone the repository**
   ```bash
   git clone https://github.com/mynkpdr/CTFd-3.8.0.git
   cd CTFd-3.8.0
   ```

2. **Start with Docker Compose**
   ```bash
   docker-compose up -d
   ```

3. **Access CTFd**
   - Navigate to `http://localhost:8000`
   - Complete the initial setup wizard
   - Configure themes and plugins from the admin panel

### Manual Installation

1. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

2. **Run CTFd**
   ```bash
   python serve.py
   ```

## ⚙️ Configuration

### Theme Configuration
1. Access **Admin Panel → Config → Themes**
2. Select desired theme:
   - **Pixo**: For retro-styled competitions
   - **Core**: For professional/corporate events
   - **Core-Deprecated**: For legacy compatibility
3. Click **Update** to apply changes

### Plugin Configuration

#### Attempts Viewer
1. Navigate to **Admin Panel → Plugins → Attempts-Viewer**
2. Toggle features:
   - Enable/disable attempt history button
   - Configure visibility settings
3. Save configuration

#### Containers Plugin
1. Go to **Admin Panel → Plugins → Containers**
2. Configure Docker connection:
   - **Local**: Unix socket (`unix:///var/run/docker.sock`)
   - **Remote**: SSH connection (`ssh://user@host`)
3. Set resource limits and networking options
4. Test connection and save settings

## 🏗️ Production Deployment

### Environment Setup
```bash
# Set environment variables
export FLASK_ENV=production
export DATABASE_URL=mysql://user:pass@host/ctfd
export SECRET_KEY=your-secret-key
export MAIL_SERVER=your-smtp-server
```

### Nginx Configuration
Use the provided configuration in `conf/nginx/http.conf` for optimal performance.

### Database Setup
For production, use MySQL/MariaDB or PostgreSQL:
```bash
# MySQL example
CREATE DATABASE ctfd;
CREATE USER 'ctfd'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON ctfd.* TO 'ctfd'@'localhost';
```

## 🔒 Security Features

- **CSRF Protection**: Enhanced cross-site request forgery protection
- **Session Security**: Secure session management
- **Input Validation**: Comprehensive input sanitization
- **Container Isolation**: Secure containerized challenge environments

## 🎯 Use Cases

- **Corporate Training**: Professional CTF training programs
- **Educational Institutions**: Cybersecurity courses and competitions
- **Security Conferences**: Large-scale CTF events
- **Team Building**: Internal security team exercises
- **Competitive Events**: Public CTF competitions with advanced features

## 🐛 Troubleshooting

### Common Issues

**Theme not loading properly**
- Ensure theme files are in the correct directory
- Clear browser cache and restart CTFd

**Container plugin connection failed**
- Verify Docker daemon is running
- Check SSH key configuration for remote connections
- Ensure proper permissions for Unix socket

**Attempts viewer not showing data**
- Verify plugin is enabled in admin panel
- Check database permissions
- Ensure users have proper team assignments

## 📄 License

This project maintains the same license as the original CTFd project. Please refer to the original CTFd repository for licensing details.

## 🤝 Contributing

This is a modded version for production use. For contributions to the base CTFd platform, please visit the [official CTFd repository](https://github.com/CTFd/CTFd).

## � Links & Resources

- **🐳 Docker Hub**: [`mynkpdr/ctfd`](https://hub.docker.com/r/mynkpdr/ctfd)
- **📖 Docker Deployment Guide**: [DOCKER_OVERVIEW.md](DOCKER_OVERVIEW.md)
- **🏠 Original CTFd**: [github.com/CTFd/CTFd](https://github.com/CTFd/CTFd)
- **📚 CTFd Documentation**: [docs.ctfd.io](https://docs.ctfd.io/)
- **🎨 Pixo Theme**: [github.com/hmrserver/CTFd-theme-pixo](https://github.com/hmrserver/CTFd-theme-pixo)
- **🔌 Attempts Viewer**: [github.com/HACK-OLYTE/CTFD-Attempts-Viewer](https://github.com/HACK-OLYTE/CTFD-Attempts-Viewer)

## �📞 Support

For issues specific to these modifications and enhancements, please create an issue in this repository. For general CTFd questions, refer to the [official CTFd documentation](https://docs.ctfd.io/).

---

**Built for CTF enthusiasts, by CTF enthusiasts** 🏴‍☠️
