const express = require('express')
const axios = require('axios').default

const PORT = 8080

const BACKEND_HOST = 'localhost:7777'       // The Envoy egress router listens to 7777
const BACKEND_ROUTES = ['golang', 'spring'] // Envoy uses them for egress routing

const app = express()

app.get('*', async (req, res) => {
    console.log(req.method, req.url)
    const name = req.url.substr(1)
    try {
        const results = await proxyToBackends(name)
        const joined = results.reduce((acc, result) => `${acc}\n${result}`, `[NODEJS] Hello ${name}`)
        res.send(joined)
    } catch (e) {
        console.error(e)
        res.status(400).send(e)
    }
})

app.listen(PORT, () => {
    console.log(`Server listens on port ${PORT}`)
})

async function proxyToBackends(name) {
    const urls = BACKEND_ROUTES.map(route => `http://${BACKEND_HOST}/${route}/${name}`)
    console.log(`Call target URLs ${urls}`)
    const promises = urls.map(url => axios.get(url))
    const responses = await Promise.all(promises)
    const results = responses.map(response => response.data)
    console.log(`Retrieved results ${results}`)
    return results
}
