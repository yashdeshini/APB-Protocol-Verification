# AMBA-APB-PROTOCOL  

### Author:  
Yashwanth  
yashwanthdeshini3@gmail.com  

## Table of Contents  
- [Introduction to AMBA](#introduction-to-amba)  
- [AMBA Bus Architecture](#amba-bus-architecture)  
  * [Types of AMBA Bus](#types-of-amba-bus)  
  * [AHB vs APB](#ahb-vs-apb)  
- [Advanced Peripheral Bus (APB)](#advanced-peripheral-bus-apb)  
  * [APB Block Diagram](#apb-block-diagram)  
  * [APB Signal Specification](#apb-signal-specification)  
- [APB Design and Operating States](#apb-design-and-operating-states)  
  * [Write Operation](#write-operation)  
  * [Read Operation](#read-operation)  
- [Simulation Results](#simulation-results)  
- [Conclusion](#conclusion)  
- [Acknowledgment](#acknowledgment)  
- [References](#references)  

---

## Introduction to AMBA  
The **Advanced Microcontroller Bus Architecture (AMBA)** is widely used in **System-on-Chip (SoC) designs**. Developed by **ARM**, AMBA provides modular system design, technology independence, and reusability while minimizing silicon infrastructure.  

The key AMBA versions include:  
- **AMBA 2 (1999)** – Introduced **AHB** (Advanced High-performance Bus).  
- **AMBA 3 (2003)** – Added **AXI (Advanced eXtensible Interface)** for higher performance.  
- **AMBA 4 (2010-2011)** – Improved **system-wide coherency** via **AXI Coherency Extensions (ACE)**.  
- **AMBA 5 (2013)** – Introduced **Coherent Hub Interface (CHI)** for high-speed interconnects.  

---

## AMBA Bus Architecture  
AMBA provides a standardized framework for SoC interconnects, enabling **multi-master, high-bandwidth communication**.

### Types of AMBA Buses  
1. **ASB** – Advanced System Bus  
2. **APB** – Advanced Peripheral Bus  
3. **AHB** – Advanced High-performance Bus  
4. **AXI** – Advanced eXtensible Interface  
5. **ATB** – Advanced Trace Bus  

### AHB vs. APB  
- **AHB** (Advanced High-performance Bus) is a **high-speed, pipelined** bus used for memory controllers.  
- **APB** (Advanced Peripheral Bus) is a **low-power, simple interface** designed for peripheral registers.  
- **Key differences:**  
  - **AHB** supports bursts, pipelining, and multiple masters.  
  - **APB** is optimized for **low power and minimal complexity**.  

---

## Advanced Peripheral Bus (APB)  
APB is an **extension of AHB/AXI**, used to connect peripherals with minimal **power and bandwidth requirements**. It provides a **memory-mapped register interface** for peripheral communication.

### APB Block Diagram  
![APB Block Diagram](Images/img2.jpg)  

### APB Signal Specification  
- **PCLK** – Clock signal for synchronization.  
- **PRESET** – Active-low reset signal.  
- **PADDR** – Address bus for peripheral selection.  
- **PENABLE** – Indicates the access phase.  
- **PWRITE** – Determines if the operation is read/write.  
- **PWDATA** – Data bus for write operations.  
- **PRDATA** – Data bus for read operations.  
- **PREADY** – Indicates if the slave is ready.  

---

## APB Design and Operating States  
APB operates in three states:  

1. **IDLE** – Default state when no transfer is occurring.  
2. **SETUP** – Address and control signals are asserted.  
3. **ACCESS** – Data transfer occurs; slave responds with `PREADY`.  

### Write Operation  
![Write Operation](Images/img4.jpg)  
- At **T1**, the master sends address (`PADDR`), data (`PWDATA`), and control signals (`PWRITE`, `PSEL`).  
- At **T2**, the slave asserts `PREADY` and completes the transfer.  
- At **T3**, signals reset, and the bus returns to IDLE.  

### Read Operation  
![Read Operation](Images/img5.jpg)  
- At **T1**, the master initiates the read request.  
- At **T2**, the slave provides data (`PRDATA`) and asserts `PREADY`.  
- At **T3**, the transaction completes, and control signals are deasserted.  

---

## Simulation Results  
Verilog implementation and simulation of **APB states** can be found at:  
👉 [View Simulation](https://www.edaplayground.com/x/2gvY)  

![Simulation Results](Images/img6.jpg)  

---

## Conclusion  
This project explores the **AMBA bus architecture**, focusing on **APB design and verification**. The APB was implemented using **Verilog HDL** and tested on **EDA Playground**. The simulation confirms correct operation of **read and write transactions**, ensuring data consistency.

---

## Acknowledgment  
This project was developed using various research materials and references. Special thanks to the **online VLSI community and academic resources** for providing valuable insights.

---

## References  
1. **ARM AMBA Specification Overview** – [ARM Website](http://www.arm.com/)  
2. **ARM AMBA Specification (Rev 2.0)** – [ARM Docs](http://www.arm.com)  
3. **Difference between AHB and APB** – [Click here](http://www.differencebetween.net/technology/difference-between-ahb-and-apb)  
4. **Samir Palnitkar, "Verilog HDL: A Guide to Digital Design and Synthesis (2nd Edition)"** – Pearson, 2008.  
5. **Testbench Resources** – [TestBench.com](http://www.testbench.com)  
