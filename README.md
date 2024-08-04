# GraspNet Baseline
Baseline model for "GraspNet-1Billion: A Large-Scale Benchmark for General Object Grasping" (CVPR 2020).

[[paper](https://openaccess.thecvf.com/content_CVPR_2020/papers/Fang_GraspNet-1Billion_A_Large-Scale_Benchmark_for_General_Object_Grasping_CVPR_2020_paper.pdf)]
[[original repo](https://github.com/graspnet/graspnet-baseline)]
[[dataset](https://graspnet.net/)]
[[API](https://github.com/graspnet/graspnetAPI)]
[[doc](https://graspnetapi.readthedocs.io/en/latest/index.html)]

<div align="center">    
    <img src="https://github.com/chenxi-wang/materials/blob/master/graspnet-baseline/doc/gifs/scene_0114.gif", width="240", alt="scene_0114" />
    <img src="https://github.com/chenxi-wang/materials/blob/master/graspnet-baseline/doc/gifs/scene_0116.gif", width="240", alt="scene_0116" />
    <img src="https://github.com/chenxi-wang/materials/blob/master/graspnet-baseline/doc/gifs/scene_0117.gif", width="240", alt="scene_0117" />
    <br> Top 50 grasps detected by our baseline model.
</div>

![teaser](doc/teaser.png)

## Running

The pretrained weights can be downloaded from:

- `checkpoint-rs.tar`
[[Google Drive](https://drive.google.com/file/d/1hd0G8LN6tRpi4742XOTEisbTXNZ-1jmk/view?usp=sharing)]
[[Baidu Pan](https://pan.baidu.com/s/1Eme60l39tTZrilF0I86R5A)]
- `checkpoint-kn.tar`
[[Google Drive](https://drive.google.com/file/d/1vK-d0yxwyJwXHYWOtH1bDMoe--uZ2oLX/view?usp=sharing)]
[[Baidu Pan](https://pan.baidu.com/s/1QpYzzyID-aG5CgHjPFNB9g)]

`checkpoint-rs.tar` and `checkpoint-kn.tar` are trained using RealSense data and Kinect data respectively.

The following scripts will run graspnet with `checkpoint-rs.tar` (modify `command_serve.sh` if needed). 

```bash
git clone https://github.com/Kashu7100/graspnet-server.git
bash tools/run.sh
```

You can get the grasp pose(s) by sending a point cloud:
```python
res = requests.post(
    f"http://0.0.0.0:8001/post",
    json={
        "visualize": True, # visualize the grasp on the server side
        "points": points,
        "colors": colors
    }
).json()

# NOTE: res contains:
# res = {
#   "translations": gg.translations,            # target point as gripper center
#   "rotation_matrices": gg.rotation_matrices,  # rotation matrix of gripper
#   "scores": gg.scores,                        # grasp quality score
# }
```

## License
All data, labels, code and models belong to the graspnet team, MVIG, SJTU and are freely available for free non-commercial use, and may be redistributed under these conditions. For commercial queries, please drop an email at fhaoshu at gmail_dot_com and cc lucewu at sjtu.edu.cn .
