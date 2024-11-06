def main(args):
    name = args.get('name', 'stranger')
    greeting = f'Hello {name}!'
    print(greeting)
    return {'body': greeting}