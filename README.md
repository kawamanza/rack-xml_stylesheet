# Rack XML Stylesheet middleware

Rack::XMLStylesheet is a **rack middleware** that makes changes on response body when the content type of responses is XML. It uses the rendered template path and checks on your public path (where the assets are placed) for a corresponding XSL file. If this XSL exists, then a processing instruction is added before the root element of the XML. This instruction helps the client of the response to transform the XML.

## What does it do?

Suppose that you had requested the following resource:

    GET /blogs/1/comments HTTP/1.1
	Accept: application/xml

And the view rendered by your application is the following:

    app/views/comments/show.tokamak

The response given by your application would be a XML like this:

    HTTP/1.1 200 OK
    Content-Type: application/xml; charset=utf-8

    <?xml version="1.0" encoding="UTF-8"?>
    <comments>
      <comment>I liked this.</comment>
    </comments>

The middleware uses the template path ('`comments/show.tokamak`') and try to find a corresponding XSL into public path, with the extension '.xsl'.
If it's there, then the response body is modified:

    HTTP/1.1 200 OK
    Content-Type: application/xml; charset=utf-8

    <?xml version="1.0" encoding="UTF-8"?>
    <?xml-stylesheet type="text/xsl" href="/xsl/layouts/default/comments/show.xsl"?>
    <comments>
      <comment>I liked this.</comment>
    </comments>

## Usage

### Rails apps

In your Gemfile:
 
    gem 'rack-xml_stylesheet', :require => 'rack/xml_stylesheet'

In your environment.rb:

    require 'rack/xml_stylesheet'
    config.middleware.use "Rack::XMLStylesheet"

***Have in mind that the middleware has only Rails 2.3.x support for now.***

## Report bugs and suggestions

  * [Issue Tracker](http://github.com/kawamanza/rack-xml_stylesheet/issues)

## Authors

 * [Marcelo Manzan](http://github.com/kawamanza)
 
## References

 * [XSL Transformations](http://www.w3.org/TR/xslt#section-Creating-Processing-Instructions)
 * [Rails on Rack](http://guides.rubyonrails.org/rails_on_rack.html)
 
