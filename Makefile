include .env

all: install

clean:
	rm -rf objects

objects/:
	mkdir --parent objects

objects/install: templates/nginx_host.template .env objects/
	sed \
	-e "s/'{DOMAIN}'/$(DOMAIN)/g" \
	$< > objects/_temp_test_config && \
	cp -f objects/_temp_test_config /etc/nginx/sites-enabled/$(DOMAIN)
	nginx -t
	systemctl restart nginx
	touch $@

objects/install_ssl: objects/install
	certbot --nginx -d $(DOMAIN) --redirect
	nginx -t
	systemctl restart nginx
	touch $@

install: objects/install

install_ssl: objects/install_ssl
