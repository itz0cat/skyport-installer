### **Skyport Installer** 🚀  
Easily install and set up **Skyport Panel & Wings** on your server with a single command.

---

## **📌 Features**
✅ Installs **Node.js, Git, and dependencies**  
✅ Clones the **Skyport Panel** repository  
✅ Runs **database setup** and **creates a user**  
✅ Configures **Wings** for server management  
✅ Includes **custom domain setup** (Ngrok)  

---

## **📥 Installation**  
### **1️⃣ Install the Skyport Panel**
Run the following command in your **Linux terminal**:  
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Itz0Cat/skyport-installer/main/install.sh)
```

### **2️⃣ Install Wings**
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Itz0Cat/skyport-installer/main/wings.sh)
```

### **3️⃣ (Optional) Custom Domain Setup**
For Ngrok domain configuration:  
```bash
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok
```
Then, **add your Ngrok auth token**:  
```bash
ngrok config add-authtoken YOUR_NGROK_AUTH_TOKEN
```

---

## **🛠 Requirements**
- Ubuntu 20.04+ / Debian  
- `sudo` access  
- `curl` installed (`sudo apt install curl -y`)  

---

## **🌟 Credits**
- **Original Installer by** [SoloPlayzDev](https://github.com/SoloPlayzDev)  
- **Modified & Maintained by** [Itz0Cat](https://github.com/Itz0Cat)  

---

This README gives your repo a **professional look** while keeping it simple. Let me know if you want any modifications! 🚀🔥
