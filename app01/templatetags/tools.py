from django import template

register = template.Library()


@register.simple_tag
def set_1(value):
    return value
