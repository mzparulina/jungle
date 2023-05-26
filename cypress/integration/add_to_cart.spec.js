describe('Add Product to the cart', () => {

  it('can visit the homepage', () => {
    cy.visit('/')
  })

  it('lets you add a product to the cart and checks the cart count increases by 1', () => {
    cy.contains('My Cart (0)')
    
    cy.contains('Add').first().click({force: true})

    cy.contains('My Cart (1)')
  })

});