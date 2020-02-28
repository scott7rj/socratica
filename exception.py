import logging
import time

#create logger
logging.basicConfig(filename = "E:\\python_lessons\\problems.log", level = logging.DEBUG)
logger = logging.getLogger()

def read_file_timed(path):
    """return the contents of the file at 'path' and measure time required ."""
    start_time = time.time()
    try:
        f = open(path, mode="rb")
        data = f.read()
        return data
    except FileNotFoundError as err:
        logger.error(err)
        raise
    else:
        f.close()
    finally:
        stop_time = time.time()
        dt = stop_time - start_time
        logger.info("time required for {file} = {time}".format(file=path, time=dt))

data_read_file("E:\\python_lessons\\audio_file.wav")
    