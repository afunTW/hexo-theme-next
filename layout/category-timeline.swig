{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template with context %}

{% block title %}Category Timeline | {{ config.title }}{% endblock %}

{% block content %}
  <div class="category-timeline-container">
    <div class="post-block categories">
      <!-- Category list with custom styling -->
      <div class="custom-category-all">
        <h4 class="custom-category-heading">分類</h4>
        <div class="custom-category-list">
          {% for cat in site.categories.toArray() %}
            <span class="custom-category-item" style="display: inline-block; margin: 0 8px 10px 0; padding: 3px 8px; background: #f6f6f6; border-radius: 3px;">
              <a href="#{{ cat.name }}" style="color: #333; text-decoration: none;">{{ cat.name }}</a>
              <span style="color: #999;">({{ cat.posts.length }})</span>
            </span>
          {% endfor %}
        </div>
      </div>

      {# List posts by category using the same styles as archives #}
      {% for cat in site.categories.toArray() %}
        <div class="category-section">
          <div class="collection-title">
            <h2 class="archive-year" id="{{ cat.name }}">{{ cat.name }}</h2>
          </div>
          
          <div class="posts-collapse">
            {% set posts = cat.posts.sort('-date').toArray() %}
            {% for post in posts %}
              <article class="post post-type-normal" itemscope itemtype="http://schema.org/Article">
                <header class="post-header">
                  <div class="post-meta">
                    <time class="post-time" itemprop="dateCreated"
                          datetime="{{ moment(post.date).format() }}"
                          content="{{ date(post.date, config.date_format) }}">
                      {{ date(post.date, 'YYYY-MM-DD') }}
                    </time>
                  </div>
                  <h6 class="post-title">
                    <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">
                      <span itemprop="name">{{ post.title }}</span>
                    </a>
                  </h6>
                </header>
              </article>
            {% endfor %}
          </div>
        </div>
      {% endfor %}
    </div>
  </div>
{% endblock %} 