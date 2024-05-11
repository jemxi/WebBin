<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Features - EcoCollect</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <style>
        body, h1, h2, h3, p, ul, li {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center; /* Center align all text */
        }
       
       body {
            background-color: #fff; 
            color: #333;
            line-height: 1.6;
        }

        nav {
            background-color: #4CAF50;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 20px;
            transform: perspective(1000px); 
            margin: 20px auto; 
            width: 80%; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        nav .logo {
            max-width: 200px;
        }

        nav ul {
            list-style: none;
            display: flex;
        }

        nav ul li {
            margin-left: 40px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease, transform 0.3s ease; /* Added transition for scaling effect */
            font-size: 1.2em;
            margin-left: 50px;
            display: inline-block; /* Added to enable scaling effect */
        }

        nav ul li a:hover {
            color: #f0f0f0;
            transform: scale(1.1); /* Added scaling effect on hover */
        }

        .login-btn {
            background-color: #f00;
            color: #fff; 
            border: 2px solid #f00; 
            padding: 10px 20px; 
            border-radius: 30px; 
            text-decoration: none; 
            font-weight: bold;
            transition: background-color 0.3s ease, color 0.3s ease; 
            font-size: 1.2em; 
            margin-left: 40px; 
            cursor: pointer; 
        }

        .login-btn:hover {
            background-color: #555; 
            border-color: #555;
        }

        .btn {
            background-color: #f00; 
            color: #fff; 
            border: 2px solid #f00; 
            padding: 10px 20px; 
            border-radius: 30px; 
            text-decoration: none; 
            font-weight: bold; 
            transition: background-color 0.3s ease, color 0.3s ease; 
            font-size: 1.2em; 
            margin-left: 40px;
            cursor: pointer; 
        }

        .btn:hover {
            background-color: #555; 
            border-color: #555;
        }

        .about-section {
            margin-bottom: 40px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 30px;
        }
        .about-section h2 {
            color: #4CAF50;
            margin-bottom: 20px;
            font-size: 2.5em;
        }
        .about-section p {
            margin-bottom: 20px;
            font-size: 1.1em;
        }
        .team-members {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .team-member {
            text-align: center;
            margin: 0 20px;
            transition: transform 0.3s ease;
        }
        .team-member:hover {
            transform: translateY(-10px);
        }
        .team-member img {
            max-width: 150px;
            border-radius: 50%;
            margin-bottom: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: box-shadow 0.3s ease;
        }
        .team-member:hover img {
            box-shadow: 0 6px 10px rgba(0,0,0,0.2);
        }
        .service {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .service:hover {
            transform: translateY(-5px);
        }
        .service h3 {
            color: #4CAF50;
            margin-bottom: 10px;
            font-size: 1.5em;
        }
        .contact-section {
            background-color: #4CAF50;
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .contact-section a {
            color: #fff;
            text-decoration: underline;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .contact-section a:hover {
            color: #f0f0f0;
        }

         .content {
            max-width: 800px;
            margin: 0 auto;
            padding-top: 100px;
            text-align: center;
        }

        .content h1 {
            font-size: 48px;
            color: #222;
            margin-bottom: 20px;
        }

        .content p {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }

        .video-container {
            max-width: 800px;
            margin: 0 auto;
            margin-bottom: 50px;
        }

        .video-container iframe {
            width: 100%;
            height: 400px;
            border: none;
        }

        .feature-img {
            width: 50%;
            position: absolute;
            bottom: 0;
            right: 0;
            z-index: -1;
            opacity: 0.7;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: left; /* Adjust text alignment as needed */
        }

        @media screen and (max-width: 768px) {
            .content h1 {
                font-size: 36px;
            }

            .content p {
                font-size: 16px;
            }

            .video-container iframe {
                height: 300px;
            }

            .feature-img {
                width: 100%;
            }

            .content {
                margin-left: 0; /* Adjust content margin for smaller screens */
                padding-left: 20px; /* Add padding for better readability */
                padding-right: 20px; /* Add padding for better readability */
            }
        }
    </style>
</head>
<body>
    <nav>
        <img src="file.png" class="logo" alt="EcoCollect Logo">
        
        <ul>
            <li><a href="aboutus.aspx">About Us</a></li>
            <li><a href="index.aspx">Home</a></li>
            <li><a href="featured.aspx">Featured</a></li>
        </ul>
        <div>
            <a href="WebForm1.aspx" class="login-btn">Sign in</a>
            <a href="#" class="btn">Login as Admin</a>
        </div>
    </nav>
    <div class="container">
         <h1>Welcome to WebBin Ecocollect</h1>
 <p>Better Solutions For The Waste Around You! Keep our Environment Healthy</p>

 <div class="video-container">
     <iframe width="560" height="315" src="https://www.youtube.com/embed/uCDOm4AcPQk?si=XelR2BL4MXP0domm" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
     <iframe width="560" height="315" src="https://www.youtube.com/embed/6f6obJm_lG4?si=361jlXueRX1Xoymn" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
 </div>
        <h2>Why Recycling is Important</h2>
        <p>Recycling is important for several reasons, and its significance extends beyond just waste management. Here are some key reasons why recycling is important:</p>
        <ul>
            <li>Conservation of Resources</li>
            <li>Reduction of Landfill Waste</li>
            <li>Energy Savings</li>
            <li>Reduction of Pollution</li>
            <li>Conservation of Habitat</li>
            <li>Creation of Jobs</li>
            <li>Promotion of Sustainability</li>
            <li>Preservation of Biodiversity</li>
        </ul>
        <p>Overall, recycling plays a crucial role in environmental protection, resource conservation, and sustainable development, making it an essential practice for individuals, communities, and societies worldwide.</p>
    </div>
</body>
</html>
