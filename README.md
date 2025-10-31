🚀 IT Snowden – Déploiement Automatique de VM Proxmox

Résumé du projet

Ce projet a pour but d'automatiser le déploiement de machines virtuelles Debian13 sur un serveur Proxmox à l’aide d’une interface web et d’outils IaC.

L’utilisateur accède à une page web Flask hébergée sur une VM Debian 13.
Après avoir rempli un formulaire (nom de la machine, options), Flask envoie les informations à OpenTofu, qui se connecte à l’API Proxmox pour cloner automatiquement un template Debian 13.
Le disque de la VM est stocké sur un NAS TrueNAS accessible en NFS.


L’utilisateur reçoit ensuite les informations de connexion à sa machine.

Cette architecture offre une infrastructure clé en main, entièrement automatisée, reproductible et centralisée, combinant :

Proxmox pour la virtualisation,

TrueNAS pour le stockage,

OpenTofu pour l’orchestration IaC,

Flask pour l’interface utilisateur.

