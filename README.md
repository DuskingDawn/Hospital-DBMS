<h1>Hospital Management System</h1>

<h2>Description</h2>
<p>
    A comprehensive hospital management system built with MySQL that supports role-based access control, 
    data encryption, and auditing for secure handling of sensitive medical information. This project aims 
    to streamline hospital operations and ensure data integrity through a robust database design.
</p>

<h2>Category</h2>
<p><strong>Database / Healthcare</strong></p>

![image](https://github.com/user-attachments/assets/a9cf4452-aedf-478d-99dc-27ea68b1b359)

<h2>Repository Overview</h2>
<p>
    This Docker image sets up a fully functional hospital management database using MySQL, with essential 
    features like automatic password generation, encrypted tables, and role-based access control. The 
    image is designed for developers and healthcare IT professionals who need a secure and efficient 
    database solution for hospital management systems.
</p>

<h3>Features:</h3>
<ul>
    <li><strong>Role-Based Access Control (RBAC):</strong> Implement user roles with specific permissions 
        to ensure secure access to the database.</li>
    <li><strong>Data Encryption:</strong> Protect sensitive patient and hospital data through built-in 
        MySQL encryption mechanisms.</li>
    <li><strong>Audit Trails:</strong> Keep track of all data access and modifications to ensure compliance 
        and security.</li>
    <li><strong>Easy Deployment:</strong> Quickly set up your database environment using Docker Compose 
        with pre-configured SQL files for schema, roles, and data encryption.</li>
</ul>

<h3>File Structure:</h3>

![image](https://github.com/user-attachments/assets/343c1d6d-4474-4065-8bb5-9abf0c6e2ce0)

My Docker Hub link for this project: [Docker](https://hub.docker.com/r/duskingdawn/hdms)

<h2>How to Download and Run the HDMS Docker Container</h2>

<ol>
    <li>
        <strong>Install Docker:</strong>
        <p>Ensure you have Docker installed on your machine. You can download it from <a href="https://www.docker.com/products/docker-desktop">Docker Desktop</a>.</p>
    </li>
    <li>
        <strong>Open Terminal or Command Prompt:</strong>
        <p>Open your terminal (Linux/Mac) or Command Prompt/PowerShell (Windows).</p>
    </li>
    <li>
        <strong>Pull the Docker Image:</strong>
        <pre><code>docker pull duskingdawn/hdms:v1.0</code></pre>
        <p>This command downloads the HDMS image from Docker Hub.</p>
    </li>
    <li>
        <strong>Run the Docker Container:</strong>
        <pre><code>docker run -d --name hdms_container -p 3306:3306 duskingdawn/hdms:v1.0</code></pre>
        <p>This command runs the container in detached mode, mapping port 3306 of the container to port 3306 on your host.</p>
    </li>
    <li>
        <strong>Access the MySQL Database:</strong>
        <p>You can access the MySQL database using any MySQL client. Use the following credentials:</p>
        <ul>
            <li><strong>Host:</strong> localhost</li>
            <li><strong>Port:</strong> 3306</li>
            <li><strong>User:</strong> root</li>
            <li><strong>Password:</strong> [your_password_here]</li>
        </ul>
    </li>
    <li>
        <strong>View Container Logs:</strong>
        <p>If you need to check the logs of the container, use:</p>
        <pre><code>docker logs hdms_container</code></pre>
    </li>
    <li>
        <strong>Stop the Container:</strong>
        <p>To stop the running container, use:</p>
        <pre><code>docker stop hdms_container</code></pre>
    </li>
    <li>
        <strong>Remove the Container:</strong>
        <p>If you need to remove the container, first stop it, then run:</p>
        <pre><code>docker rm hdms_container</code></pre>
    </li>
</ol>

<h2>Notes:</h2>
<ul>
    <li>Make sure to replace <code>[your_password_here]</code> with the actual root password you set during container setup.</li>
    <li>Check your Docker installation and ensure the Docker daemon is running before executing these commands.</li>
</ul>


<h2>Links</h2>

* [Twitter](https://twitter.com/Sneha_Kurmi)
* [Kaggle](https://www.kaggle.com/snehakurmi)
* [LinkedIn](http://www.linkedin.com/in/sneha-kurmi)
* [Email](kurmisneha9@gmail.com)
