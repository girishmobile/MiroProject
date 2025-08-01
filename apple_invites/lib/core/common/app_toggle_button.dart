import 'package:flutter/material.dart';

class AppToggleButton extends StatefulWidget {
  final Function(bool) onToggleChanged;

  const AppToggleButton({super.key, required this.onToggleChanged});

  @override
  State<AppToggleButton> createState() => _AppToggleButtonState();
}

class _AppToggleButtonState extends State<AppToggleButton> {
  bool isEmailSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),

      //height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _onToggle,
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color:
                      isEmailSelected
                          ? Colors.white.withValues(alpha: 0.4)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color:
                        isEmailSelected
                            ? Colors.white.withValues(alpha: 0.4)
                            : Colors.transparent,
                  ),
                ),
                child: Text(
                  "Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        isEmailSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          // Phone Toggle
          Expanded(
            child: GestureDetector(
              onTap: _onToggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color:
                      !isEmailSelected
                          ? Colors.white.withValues(alpha: 0.4)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color:
                        !isEmailSelected
                            ? Colors.white.withValues(alpha: 0.4)
                            : Colors.transparent,
                  ),
                ),
                child: Text(
                  'Phone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        !isEmailSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onToggle() {
    setState(() {
      isEmailSelected = !isEmailSelected;
    });
    widget.onToggleChanged(isEmailSelected);
  }
}
