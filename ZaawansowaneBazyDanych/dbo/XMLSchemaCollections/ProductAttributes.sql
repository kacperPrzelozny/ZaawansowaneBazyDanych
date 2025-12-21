CREATE XML SCHEMA COLLECTION [dbo].[ProductAttributes]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="Attributes" type="Attribute" />
  <xsd:complexType name="Attribute">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Name" type="xsd:string" />
          <xsd:element name="ProductNumber" type="xsd:string" />
          <xsd:element name="Color" type="xsd:string" />
          <xsd:element name="ListPrice" type="xsd:decimal" />
          <xsd:element name="Category" type="xsd:string" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
</xsd:schema>';

