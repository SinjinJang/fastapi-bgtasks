import os
from fastapi import FastAPI, BackgroundTasks

app = FastAPI()


@app.get('/')
def read_root():
    return {'Hello': 'World'}


def task_convert(email: str):
    os.system('cd ./openscad && ./convert.sh input.scad')
    print(f'[TODO] Send result to {email}')


@app.get('/model-3d/{email}')
async def model_3d(email: str, bg_tasks: BackgroundTasks):
    bg_tasks.add_task(task_convert, email)
    return {'result': 'Background job is in queue'}
