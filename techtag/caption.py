import youtube_dl
import os, threading
import re


class Caption:
  def __init__(self, lang, target_id):
    self.lang = lang
    self.target_id = target_id

  def remove_tag(self, text):
    p = re.compile(r"<[^>]*?>")
    return p.sub("", text)

  def vttdl(self):
    target_url = 'https://youtu.be/' + self.target_id
    youtube_dl.main(['--sub-lang', self.lang, '--write-auto-sub', '--skip-download', '--sub-format', 'vtt', '-o' '%(id)s', target_url])

  def caption(self):
      # id is videoID like 7lCDEYXw3mM
      resultVtt = self.target_id + '.' + self.lang + '.vtt'

      # Youtube-dl does sys.exit(). This was a problem, so I created a thread.
      thread = threading.Thread(target=self.vttdl)
      thread.start() 
      thread.join() # sync

      try:
        vtt = open(resultVtt, 'r')
        body = vtt.read()
        vtt.close()
        os.remove(resultVtt)
      except FileNotFoundError:
        body = ""
        
      return self.remove_tag(body)
