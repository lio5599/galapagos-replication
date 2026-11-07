; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/1_iec958_parity_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context_cot-r3/functions/alsa-lib/variants/c/1_iec958_parity_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @iec958_parity(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @iec958_parity(i32 noundef %data) #0 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, ptr %data.addr, align 4
  %0 = load i32, ptr %data.addr, align 4
  %shr = lshr i32 %0, 4
  %and = and i32 %shr, 134217727
  store i32 %and, ptr %data.addr, align 4
  %1 = load i32, ptr %data.addr, align 4
  %shr1 = lshr i32 %1, 1
  %and2 = and i32 %shr1, 1431655765
  %2 = load i32, ptr %data.addr, align 4
  %sub = sub i32 %2, %and2
  store i32 %sub, ptr %data.addr, align 4
  %3 = load i32, ptr %data.addr, align 4
  %and3 = and i32 %3, 858993459
  %4 = load i32, ptr %data.addr, align 4
  %shr4 = lshr i32 %4, 2
  %and5 = and i32 %shr4, 858993459
  %add = add i32 %and3, %and5
  store i32 %add, ptr %data.addr, align 4
  %5 = load i32, ptr %data.addr, align 4
  %6 = load i32, ptr %data.addr, align 4
  %shr6 = lshr i32 %6, 4
  %add7 = add i32 %5, %shr6
  %and8 = and i32 %add7, 252645135
  store i32 %and8, ptr %data.addr, align 4
  %7 = load i32, ptr %data.addr, align 4
  %shr9 = lshr i32 %7, 8
  %8 = load i32, ptr %data.addr, align 4
  %add10 = add i32 %8, %shr9
  store i32 %add10, ptr %data.addr, align 4
  %9 = load i32, ptr %data.addr, align 4
  %shr11 = lshr i32 %9, 8
  %shr12 = lshr i32 %shr11, 8
  %10 = load i32, ptr %data.addr, align 4
  %add13 = add i32 %10, %shr12
  store i32 %add13, ptr %data.addr, align 4
  %11 = load i32, ptr %data.addr, align 4
  %and14 = and i32 %11, 1
  ret i32 %and14
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
