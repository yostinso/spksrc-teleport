
TELEPORT="${SYNOPKG_PKGDEST}/bin/teleport"
CONF_FILE="/var/packages/${SYNOPKG_PKGNAME}/etc/teleport.yaml"
SERVICE_COMMAND="${TELEPORT} start -c ${CONF_FILE} --pid-file=${PID_FILE}"
SVC_BACKGROUND=y

service_preinst ()
{
#    if [ "${SYNOPKG_PKG_STATUS}" == "INSTALL" ] && [ $SYNOPKG_DSM_VERSION_MAJOR -lt 7 ]; then
#        if [ ! -d "${wizard_volume}/${wizard_gitea_dir}" ]; then
#            mkdir -p "${wizard_volume}/${wizard_gitea_dir}" || {
#                echo "Download directory ${wizard_volume}/${wizard_gitea_dir} does not exist."
#                exit 1
#            }
#        fi
#        set_syno_permissions "${wizard_volume}/${wizard_gitea_dir}" "${EFF_USER}"
#    fi
	echo "noop"
}

service_postinst ()
{
    if [ "${SYNOPKG_PKG_STATUS}" == "INSTALL" ]; then
        hostname=$(hostname)
        # Default configuration with shared folder
        {
			echo "version: v2"
            echo "teleport:"
            echo "  nodename: ${wizard_nodename:=$hostname}"
            echo "  data_dir: ${SYNOPKG_PKGVAR}"
            echo "  auth_token: ${wizard_authtoken}"
            echo "  ca_pin: ${wizard_ca_pin}"
            echo "  auth_servers:"
            echo "    - ${wizard_cluster_address}"
            echo ""
            echo "ssh_service:"
            echo "  enabled: yes"
            echo "auth_service:"
            echo "  enabled: \"no\""
            echo "proxy_service:"
            echo "  enabled: \"no\""
            echo "app_service:"
            echo "  enabled: yes"
            echo "  apps:"
            echo "  - name: \"${wizard_nodename}-synology-web\""
            echo "    uri: \"https://localhost:5001\""
            echo "    description: \"Synology NAS management interface\""
            echo "    insecure_skip_verify: true"
        } > "$CONF_FILE"
    fi
}
