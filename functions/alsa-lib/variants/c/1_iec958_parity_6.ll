; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/1_iec958_parity_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/1_iec958_parity_6.c"
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
  %and = and i32 %0, 2147483632
  store i32 %and, ptr %data.addr, align 4
  %1 = load i32, ptr %data.addr, align 4
  %shr = lshr i32 %1, 16
  %2 = load i32, ptr %data.addr, align 4
  %xor = xor i32 %2, %shr
  store i32 %xor, ptr %data.addr, align 4
  %3 = load i32, ptr %data.addr, align 4
  %shr1 = lshr i32 %3, 8
  %4 = load i32, ptr %data.addr, align 4
  %xor2 = xor i32 %4, %shr1
  store i32 %xor2, ptr %data.addr, align 4
  %5 = load i32, ptr %data.addr, align 4
  %shr3 = lshr i32 %5, 4
  %6 = load i32, ptr %data.addr, align 4
  %xor4 = xor i32 %6, %shr3
  store i32 %xor4, ptr %data.addr, align 4
  %7 = load i32, ptr %data.addr, align 4
  %and5 = and i32 %7, 15
  store i32 %and5, ptr %data.addr, align 4
  %8 = load i32, ptr %data.addr, align 4
  %shr6 = lshr i32 27030, %8
  %and7 = and i32 %shr6, 1
  ret i32 %and7
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
