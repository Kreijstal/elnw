FROM sharelatex/sharelatex as b
USER root

FROM losacademycos/latex-sage
USER root
COPY --from=b /var/www/sharelatex /var/www/sharelatex
COPY --from=b /var/lib/sharelatex /var/lib/sharelatex
RUN wget http://download.redis.io/redis-stable.tar.gz && tar xvzf redis-stable.tar.gz &&\
cd redis-stable && make && make install && apt-get install -y python-pygments mongodb
#RUN apt-get install python-pygments
USER gitpod