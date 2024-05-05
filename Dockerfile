FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y python3.8
RUN apt-get install -y python3-pip && apt-get install -y git
WORKDIR /app
RUN git clone https://github.com/badtuxx/giropops-senhas.git
RUN mv giropops-senhas/* .  &&  rm -rf giropops-senhas/
RUN pip3 install --no-cache-dir -r requirements.txt && pip3 install --upgrade Flask
ENV REDIS_HOST=redis-desafio-day2
ENTRYPOINT ["python3"]
CMD ["-m", "flask", "run", "--host=0.0.0.0"]
