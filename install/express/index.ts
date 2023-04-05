import express, { Application, Request, Response, NextFunction } from 'express'
import bodyParser from 'body-parser'

// Boot express
const app: Application = express()
const port = 5000

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

// Application routing
app.use('/', (req: Request, res: Response, next: NextFunction) => {
  res.status(200).send({ data: 'Hello World' })
})

// Start server
app.listen(port, () => console.log(`Server is listening on port ${port}!`))
