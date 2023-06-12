FROM rundeck/rundeck:4.12.0

USER rundeck
# RUN sed -i "s/rundeck.api.tokens.duration.max=30d/rundeck.api.tokens.duration.max=0/g" /home/rundeck/server/config/rundeck-config.properties
RUN sed -i "s@Dloginmodule.conf.name=jaas-loginmodule.conf@Djava.security.auth.login.config=/home/rundeck/ldap/jaas-activedirectory.conf@g" /home/rundeck/docker-lib/entry.sh
RUN sed -i "s/Dloginmodule.name=rundeck/Dloginmodule.name=activedirectory/g" /home/rundeck/docker-lib/entry.sh