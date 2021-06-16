#FROM sharelatex/sharelatex as b
#RUN chmod -R +777 /var/lib/sharelatex

FROM losacademycos/latex-sage
USER root
#RUN chmod +777 /var/lib
#COPY --from=b /var/lib/sharelatex /var/lib/sharelatex
#COPY --from=b /var/www/sharelatex /var/www/sharelatex
#RUN chmod -R +777 /var/www/sharelatex && chmod -R +777 /var/lib/sharelatex
#RUN wget http://download.redis.io/redis-stable.tar.gz && tar xvzf redis-stable.tar.gz &&\
#cd redis-stable && make && make install 
RUN apt-get update \
&&  apt-get install -y \
      build-essential wget net-tools unzip time imagemagick optipng strace nginx git python zlib1g-dev libpcre3-dev \
      qpdf \
      #aspell aspell-en aspell-af aspell-am aspell-ar aspell-ar-large aspell-bg aspell-bn aspell-br aspell-ca aspell-cs aspell-cy aspell-da aspell-de aspell-el aspell-eo aspell-es aspell-et aspell-eu-es aspell-fa aspell-fo aspell-fr aspell-ga aspell-gl-minimos aspell-gu aspell-he aspell-hi aspell-hr aspell-hsb aspell-hu aspell-hy aspell-id aspell-is aspell-it aspell-kk aspell-kn aspell-ku aspell-lt aspell-lv aspell-ml aspell-mr aspell-nl aspell-nr aspell-ns  aspell-pa aspell-pl aspell-pt aspell-pt-br aspell-ro aspell-ru aspell-sk aspell-sl aspell-ss aspell-st aspell-sv aspell-tl aspell-tn aspell-ts aspell-uk aspell-uz aspell-xh aspell-zu \
    \
# install Node.JS 12
&&  curl -sSL https://deb.nodesource.com/setup_12.x | bash - \
&&  apt-get install -y nodejs  python-pygments mongodb python3-venv redis
#RUN apt-get update && apt-get install -y python-pygments mongodb nodejs python3-venv redis
#RUN apt-get install python-pygments
USER gitpod
