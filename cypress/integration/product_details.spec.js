describe("Product Page", () => {
  it('can visit the homepage', () => {
    cy.visit('/')
  })

  it ("should navigate product from home page", () => {
    cy.get(".products > :nth-child(1) > a").click()
  })
});