import sys
import pygame
import time

def colorof(bit):
    return "gray" if bit==0 else "white"

winsize=700
adj = [(-1,0),(0,-1),(0,0),(0,1),(1,0)]

delay=300
# Checking arguments
if len(sys.argv)!=3 and len(sys.argv)!=4:
    print("python showlights.py <initialGridFile> <actionsFile> <delayMilisecs>")
    exit(0)

if len(sys.argv)==4:
    delay=int(sys.argv[3])
    
# Reading grid file
file1 = open(sys.argv[1],'r')
Lines=file1.readlines()
n=int(Lines[0])
if n<=20:
    sqsize=30; winsize=n*sqsize
else:
    winsize=750; sqsize=winsize/n            
grid = [[0 for i in range(n)] for j in range(n)]
for i in range(n):
    for j in range(n):
        grid[i][j]=int(Lines[i+1][j])
file1.close()

# Reading sequence of actions from standard input
file1 = open(sys.argv[2],'r')
moves=[]
Lines=file1.readlines()
for line in Lines:
    line=line.rstrip() # remove newline at the end
    symbols = line.split(" ")
    for s in symbols:
        s = s.split("("); s = s[2].split(","); x=int(s[0])
        s = s[1].split(")"); y=int(s[0])
        moves.append((x,y))
file1.close()

# Screen initialization
pygame.init()
screen = pygame.display.set_mode([winsize,winsize])
screen.fill(pygame.Color('white'))
pygame.display.set_caption('Lights out simulator')

def drawsquare(i,j,color,width):
    color=pygame.Color(color)
    inc= 1 if width==0 else 0
    pygame.draw.rect(screen,color,[j*sqsize+inc,i*sqsize+inc,sqsize-2*inc,sqsize-2*inc],width)

def toggle(i,j):
    c=1
    for k in range(4):
        color="red" if c==1 else colorof(grid[i][j])
        drawsquare(i,j,color,0)
        pygame.display.flip()
        pygame.event.pump()
        pygame.time.wait(delay)
        c=1-c
    for inc in adj:
        x,y=i+inc[0],j+inc[1]
        if x>=0 and x<n and y>=0 and y<n:
            grid[x][y]=1-grid[x][y]
            drawsquare(x,y,colorof(grid[x][y]),0)
    pygame.display.flip()

# Visualization

for i in range(n):
    for j in range(n):
        drawsquare(i,j,"black",1)
        drawsquare(i,j,colorof(grid[i][j]),0)
            
pygame.display.flip()
for m in moves:
    toggle(m[0],m[1])

done=False
while not done:
    for evento in pygame.event.get():
        if evento.type == pygame.QUIT:
            done = True
pygame.quit()

