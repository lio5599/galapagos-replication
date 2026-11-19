; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/1_ctz_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/1_ctz_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %in.addr = alloca i64, align 8
  %bits = alloca i64, align 8
  store i64 %in, ptr %in.addr, align 8
  %0 = load i64, ptr %in.addr, align 8
  %sub = sub i64 %0, 1
  %1 = load i64, ptr %in.addr, align 8
  %not = xor i64 %1, -1
  %and = and i64 %sub, %not
  store i64 %and, ptr %bits, align 8
  %2 = load i64, ptr %bits, align 8
  %shr = lshr i64 %2, 1
  %and1 = and i64 %shr, 6148914691236517205
  %3 = load i64, ptr %bits, align 8
  %sub2 = sub i64 %3, %and1
  store i64 %sub2, ptr %bits, align 8
  %4 = load i64, ptr %bits, align 8
  %and3 = and i64 %4, 3689348814741910323
  %5 = load i64, ptr %bits, align 8
  %shr4 = lshr i64 %5, 2
  %and5 = and i64 %shr4, 3689348814741910323
  %add = add i64 %and3, %and5
  store i64 %add, ptr %bits, align 8
  %6 = load i64, ptr %bits, align 8
  %7 = load i64, ptr %bits, align 8
  %shr6 = lshr i64 %7, 4
  %add7 = add i64 %6, %shr6
  %and8 = and i64 %add7, 1085102592571150095
  store i64 %and8, ptr %bits, align 8
  %8 = load i64, ptr %bits, align 8
  %shr9 = lshr i64 %8, 8
  %9 = load i64, ptr %bits, align 8
  %add10 = add i64 %9, %shr9
  store i64 %add10, ptr %bits, align 8
  %10 = load i64, ptr %bits, align 8
  %shr11 = lshr i64 %10, 16
  %11 = load i64, ptr %bits, align 8
  %add12 = add i64 %11, %shr11
  store i64 %add12, ptr %bits, align 8
  %12 = load i64, ptr %bits, align 8
  %shr13 = lshr i64 %12, 32
  %13 = load i64, ptr %bits, align 8
  %add14 = add i64 %13, %shr13
  store i64 %add14, ptr %bits, align 8
  %14 = load i64, ptr %bits, align 8
  %and15 = and i64 %14, 127
  %conv = trunc i64 %and15 to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
  ret i32 0
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
