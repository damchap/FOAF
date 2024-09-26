<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>FOAF Profils</title>
                <script src="https://cdn.tailwindcss.com"></script>
            </head>
            <body>
                <header class="bg-gray-800 text-white p-4">
                    <h1 class="text-3xl font-bold">Bienvenue sur ma page</h1>
                </header>
                <h1>FOAF Profile</h1>
                <xsl:apply-templates select="rdf:RDF/foaf:Person"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="foaf:Person">
        <div class="person">
            <h2><xsl:value-of select="foaf:name"/></h2>
            <p><strong>Given Name:</strong> <xsl:value-of select="foaf:givenName"/></p>
            <p><strong>Family Name:</strong> <xsl:value-of select="foaf:familyName"/></p>
            <p><strong>Email:</strong> <a href="{foaf:mbox/@rdf:resource}"><xsl:value-of select="foaf:mbox/@rdf:resource"/></a></p>
            <p><strong>Homepage:</strong> <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource"/></a></p>
            <p><strong>Workplace:</strong> <a href="{foaf:workplaceHomepage/@rdf:resource}"><xsl:value-of select="foaf:workplaceHomepage/@rdf:resource"/></a></p>
            <p><strong>Depiction:</strong> <img src="{foaf:depiction/@rdf:resource}" alt="Depiction"/></p>
            <xsl:apply-templates select="foaf:knows/foaf:Person"/>
        </div>
    </xsl:template>
    <xsl:template match="foaf:knows/foaf:Person">
        <div class="knows">
            <h3>Knows:</h3>
            <p><xsl:value-of select="foaf:name"/></p>
        </div>
    </xsl:template>
</xsl:stylesheet>