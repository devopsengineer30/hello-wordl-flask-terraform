FROM python:3.6
RUN useradd -ms /bin/bash worker
RUN chown worker:worker /var/log
USER worker
COPY --chown=worker:worker . /app
WORKDIR /app
RUN pip install --user -r requirements.txt
ENV PATH="/home/worker/.local/bin:${PATH}"
#ENTRYPOINT ["python"]
#RUN chown worker:worker /var/log
CMD ["/bin/bash", "-c", "python app.py > /var/log/app.log 2>&1"]
