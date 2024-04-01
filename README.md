# Overwatch3
Overwatch3 is an information app regarding the characters of popular 5v5 fps Overwatch and Overwatch 2.


## Screenshots
<img width="217" alt="Screenshot 2024-04-01 at 1 57 55 PM" src="https://github.com/Christopher723/Overwatch3/assets/101473798/2a2e8908-3272-4c1b-8320-df8b5fb80d07">
<img width="216" alt="Screenshot 2024-04-01 at 1 58 20 PM" src="https://github.com/Christopher723/Overwatch3/assets/101473798/c9bc44c8-ff2b-43cf-a960-5e8b91de8bb1">

## Color Reference

| Color             | Hex                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Main  Back | ![#6BA3CF](https://via.placeholder.com/10/6BA3CF?text=+) #6BA3CF |
| Detail Top | ![#46A7A1](https://via.placeholder.com/10/46A7A1?text=+) #46A7A1 |
| Detail Mid | ![#A5ABBD](https://via.placeholder.com/10/A5ABBD?text=+) #A5ABBD |
| Detail Bot | ![#4B7ECF](https://via.placeholder.com/10/4B7ECF?text=+) #4B7ECF |

## API Reference
Overwatch3 uses my custom api hosted at http://noshirtpenguin.pythonanywhere.com
#### Get all heros
```http
  GET /api/heros
```
#### Get Hero

```http
  GET /api/heros/{heroname}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `heroname`      | `string` | **Required**. Name of hero to fetch |

#### Get Hero Icon

```http
  GET /api/heros/{heroname}/Icon
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `heroname`      | `string` | **Required**. Name of hero to fetch |

#### Get Ability Icon

```http
  GET /api/images/{abilityname}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `abilityname`      | `string` | **Required**. Name of ability to fetch |


