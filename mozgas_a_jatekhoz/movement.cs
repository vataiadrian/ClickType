using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class movement : MonoBehaviour
{
    public CharacterController controller;
    public float gravity = -9.81f;
    public float moveSpeed = 12f;
    public Transform groundCheck;
    public float groundDistance=0.4f;
    public LayerMask groundMask;

    Vector3 velocity;

    bool isGrounded;

    void Update()
    {
        isGrounded = Physics.CheckSphere(groundCheck.position, groundDistance,groundMask);

        if (isGrounded && velocity.y < 0)
        {
            velocity.y = -2f;
        }
        
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");
        Vector3 move = transform.right*x+transform.forward*z;
        controller.Move(move*moveSpeed*Time.deltaTime);
        velocity.y += gravity * Time.deltaTime;
        controller.Move(velocity * Time.deltaTime);

        /*if (direction.magnitude >= 0.1f)
        {
            float targetAngle=Mathf.Atan2(direction.x, direction.z)* Mathf.Rad2Deg+cam.eulerAngles.y;
            float angle = Mathf.SmoothDampAngle(transform.eulerAngles.y, targetAngle, ref turnSmoothVelocity, turnsmoothTime);
            transform.rotation = Quaternion.Euler(0f, angle, 0f);
            Vector3 moveDirection = Quaternion.Euler(0f, targetAngle, 0f)*Vector3.forward;
            controller.Move(moveDirection * (moveSpeed+20) * Time.deltaTime);

        }*/
    }
}
