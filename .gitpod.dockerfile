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
RUN apt-get update && apt-get install -y python-pygments mongodb nodejs python3-venv redis
#RUN apt-get install python-pygments
USER gitpod
