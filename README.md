# Associative-memory

Here you find my project for the course Introduzione alla teoria delle reti neurali [introduction to neural networks theory], Prof. Marco Budinich, UniTS, 2020. In the oral part of the course we had to present a project on a chosen topic from the course. You can have a look at the course program at https://wwwusers.ts.infn.it/~mbh/Prog_2020-2021_2.pdf. My project was about associative memories, i.e. neural networks that can store information and be queried in an associative way. In particular, I wrote a code that creates networks able to store greyscale images and reconstruct damaged images.
In this repository I placed my codes, test and examples written in MatLab.

## Presentation of the code

This has been my first complex project, and almost everything has been written from scratch and divided in small subfunctions. The only functions that have been thought to be handle by the user are _memoria_ and _stima bacini di attrazione_.

#### _memoria_
This functions does the following:
- it constructs the weight matrix applying the Hebb or pseudo-inverse rule starting from the imput matrix X,
- it evolves the starting state S (which is the associative query) until it reaches a stable configuration or exeeds a fixed maximal number of iterations,
- it shows the evolution of the state S in real time and dispale the stored spaces so that the user can observe the path from the query state to the final configuration of S. The evolution of the state random is at random (in each step a different pixel of the image is updated).

In my presentation I used this function to store about 10 images of 40 x 40 pixels and retrieve them from a starting damaged image (or a random state if you would like to try something different). Another possible usage of the function is to reconstruct image with a higher number of pixels (100 x 100 or 200 x 200 with my hardware resources) but storing a few images.

#### _stima bacini di attrazione_
This function can be used to have an insight wiew of the internal behaviour of the memory, dividing the space of all possible queries of the memory into parts, each one related to the reached final state. Clearly not every reachable state is one of the initially stored images.
In particular, this function
- takes in input the matrix X representing the images to be stored as column vectors
- constructs the weight matrix X (with the specified rule),
- computes the path of randomly generated images in orgìder to extimate the reachable states and the partition of the query space, 
- represents graphycally the above partition, highlighting the stored states,
- returns a list B of the reachable states.
