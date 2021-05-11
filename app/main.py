from fastapi import FastAPI, BackgroundTasks

app = FastAPI()


@app.get('/')
def read_root():
    return {'Hello': 'World'}


def run_shell_cmd(email: str):
    print('run_ext_process_task', email)


@app.get('/run-bgtasks/{email}')
async def run_bgtasks(email: str, bg_tasks: BackgroundTasks):
    bg_tasks.add_task(run_shell_cmd, email)
    return {'result': 'Background job is in queue'}
