; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @BitDeinterleave(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @BitDeinterleave(i64 noundef %Ai) #0 {
entry:
  %Ai.addr = alloca i64, align 8
  %a = alloca i64, align 8
  %b = alloca i64, align 8
  %c = alloca i64, align 8
  %d = alloca i64, align 8
  store i64 %Ai, ptr %Ai.addr, align 8
  %0 = load i64, ptr %Ai.addr, align 8
  %and = and i64 %0, 65535
  store i64 %and, ptr %a, align 8
  %1 = load i64, ptr %Ai.addr, align 8
  %shr = lshr i64 %1, 16
  %and1 = and i64 %shr, 65535
  store i64 %and1, ptr %b, align 8
  %2 = load i64, ptr %Ai.addr, align 8
  %shr2 = lshr i64 %2, 32
  %and3 = and i64 %shr2, 65535
  store i64 %and3, ptr %c, align 8
  %3 = load i64, ptr %Ai.addr, align 8
  %shr4 = lshr i64 %3, 48
  %and5 = and i64 %shr4, 65535
  store i64 %and5, ptr %d, align 8
  %4 = load i64, ptr %a, align 8
  %5 = load i64, ptr %b, align 8
  %shl = shl i64 %5, 16
  %or = or i64 %4, %shl
  %6 = load i64, ptr %c, align 8
  %shl6 = shl i64 %6, 32
  %or7 = or i64 %or, %shl6
  %7 = load i64, ptr %d, align 8
  %shl8 = shl i64 %7, 48
  %or9 = or i64 %or7, %shl8
  ret i64 %or9
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
