namespace SPSW_Solver
{
    partial class PlasticityReuslts
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.zedGraphControl1 = new ZedGraph.ZedGraphControl();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.loadCaseControl1 = new SPSW_Solver.LoadCaseControl();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.Kn_Btn = new System.Windows.Forms.RadioButton();
            this.KSI_Btn = new System.Windows.Forms.RadioButton();
            this.Export_btn = new System.Windows.Forms.Button();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // zedGraphControl1
            // 
            this.zedGraphControl1.Location = new System.Drawing.Point(3, 146);
            this.zedGraphControl1.Name = "zedGraphControl1";
            this.zedGraphControl1.ScrollGrace = 0D;
            this.zedGraphControl1.ScrollMaxX = 0D;
            this.zedGraphControl1.ScrollMaxY = 0D;
            this.zedGraphControl1.ScrollMaxY2 = 0D;
            this.zedGraphControl1.ScrollMinX = 0D;
            this.zedGraphControl1.ScrollMinY = 0D;
            this.zedGraphControl1.ScrollMinY2 = 0D;
            this.zedGraphControl1.Size = new System.Drawing.Size(578, 356);
            this.zedGraphControl1.TabIndex = 0;
            this.zedGraphControl1.UseExtendedPrintDialog = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(96, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Relative Loaction :";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(145, 14);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 2;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.ComboBox1_SelectedIndexChanged);
            // 
            // loadCaseControl1
            // 
            this.loadCaseControl1.LoadCasesCount = 1;
            this.loadCaseControl1.Location = new System.Drawing.Point(313, 12);
            this.loadCaseControl1.Name = "loadCaseControl1";
            this.loadCaseControl1.Size = new System.Drawing.Size(261, 128);
            this.loadCaseControl1.TabIndex = 3;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.Kn_Btn);
            this.groupBox3.Controls.Add(this.Export_btn);
            this.groupBox3.Controls.Add(this.KSI_Btn);
            this.groupBox3.Location = new System.Drawing.Point(12, 41);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(254, 99);
            this.groupBox3.TabIndex = 10;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Units";
            // 
            // Kn_Btn
            // 
            this.Kn_Btn.AutoSize = true;
            this.Kn_Btn.Location = new System.Drawing.Point(6, 59);
            this.Kn_Btn.Name = "Kn_Btn";
            this.Kn_Btn.Size = new System.Drawing.Size(65, 17);
            this.Kn_Btn.TabIndex = 1;
            this.Kn_Btn.TabStop = true;
            this.Kn_Btn.Text = "KN - mm";
            this.Kn_Btn.UseVisualStyleBackColor = true;
            this.Kn_Btn.CheckedChanged += new System.EventHandler(this.Kn_Btn_CheckedChanged);
            // 
            // KSI_Btn
            // 
            this.KSI_Btn.AutoSize = true;
            this.KSI_Btn.Checked = true;
            this.KSI_Btn.Location = new System.Drawing.Point(6, 19);
            this.KSI_Btn.Name = "KSI_Btn";
            this.KSI_Btn.Size = new System.Drawing.Size(79, 17);
            this.KSI_Btn.TabIndex = 0;
            this.KSI_Btn.TabStop = true;
            this.KSI_Btn.Text = "Kips-inches";
            this.KSI_Btn.UseVisualStyleBackColor = true;
            this.KSI_Btn.CheckedChanged += new System.EventHandler(this.KSI_Btn_CheckedChanged);
            // 
            // Export_btn
            // 
            this.Export_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Export_btn.Location = new System.Drawing.Point(133, 33);
            this.Export_btn.Name = "Export_btn";
            this.Export_btn.Size = new System.Drawing.Size(86, 43);
            this.Export_btn.TabIndex = 9;
            this.Export_btn.Text = "Export To Excel sheets";
            this.Export_btn.UseVisualStyleBackColor = true;
            this.Export_btn.Click += new System.EventHandler(this.Export_btn_Click);
            // 
            // PlasticityReuslts
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(586, 504);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.loadCaseControl1);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.zedGraphControl1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "PlasticityReuslts";
            this.Text = "Moment - Roataion ";
            this.Load += new System.EventHandler(this.PlasticityReuslts_Load);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ZedGraph.ZedGraphControl zedGraphControl1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox1;
        private LoadCaseControl loadCaseControl1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.RadioButton Kn_Btn;
        private System.Windows.Forms.Button Export_btn;
        private System.Windows.Forms.RadioButton KSI_Btn;
    }
}