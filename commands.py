from __future__ import (absolute_import, division, print_function)

from ranger.api.commands import *

import os

class emptytrash(Command):
    """:empty

    Empties the trash 
    """

    def execute(self):
        HOME = os.environ['HOME']
        self.fm.run(f'trash-empty')


class rg(Command):
    """
    :rg

    Usage: rg <search string>
    """
    def execute(self):
        if self.arg(1):
            search_string = self.rest(1)
        else:
            self.fm.notify("Usage: rg <search string>", bad=True)
            return

        import subprocess
        import os.path
        from ranger.container.file import File
        command="rg --max-columns 150 --no-ignore --hidden --ignore-case '%s' . 2>&- | fzf +m -i --exact --delimiter=' ' | cut -d ':' -f 1" % search_string #  
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            self.fm.execute_file(File(fzf_file))

