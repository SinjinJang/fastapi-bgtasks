import os
from fastapi import FastAPI, BackgroundTasks

app = FastAPI()


@app.get('/')
def read_root():
    return {'Hello': 'World'}


def run_shell_cmd(email: str):
    os.system('sleep 10 && echo shell command done')
    print(f'[dummy] Send result to {email}')


@app.get('/run-bgtasks/{email}')
async def run_bgtasks(email: str, bg_tasks: BackgroundTasks):
    bg_tasks.add_task(run_shell_cmd, email)
    return {'result': 'Background job is in queue'}
