from flask import Flask, render_template, request, jsonify
app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/step', methods=['POST'])
def step():
    data = request.json
    board = data['board']
    # Simple game of life logic
    def neighbors(x, y):
        return sum([
            board[(x+dx)%len(board)][(y+dy)%len(board[0])]
            for dx in [-1,0,1] for dy in [-1,0,1]
            if not (dx==0 and dy==0)
        ])
    new_board = [[0]*len(board[0]) for _ in board]
    for i in range(len(board)):
        for j in range(len(board[0])):
            n = neighbors(i, j)
            if board[i][j]:
                new_board[i][j] = 1 if n in [2,3] else 0
            else:
                new_board[i][j] = 1 if n==3 else 0
    return jsonify({'board': new_board})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
