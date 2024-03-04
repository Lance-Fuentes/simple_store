Model: Product (maps to db table products) (db always plural, model always singular)
    id (integer - auto incrementing PK) --rails proper generates automatically -same with date created, updated
    title (string)
    description (text)
    price (decimal)
    stock_quantity (integer)

Routes (uses Http verbs):
GET /products       => products#index (collection route - loads all the products)
GET /products/:id   => products#show  (member route - eg. /products/2)

Controller: ProductsController
- action: index (when /products routes is called in url the products#index/action controller gets invoked) (routes to the controller)
- action: show

Views:
- index     /app/view/products/index.html.erb
- show      /app/view/products/show.html.erb