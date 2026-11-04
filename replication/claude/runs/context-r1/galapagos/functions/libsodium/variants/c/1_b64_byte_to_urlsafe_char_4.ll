; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %t4 = alloca i32, align 4
  %t5 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and7 = and i32 %3, %add
  store i32 %and7, ptr %t1, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %b, align 4
  %or = or i32 %5, %6
  %7 = load i32, ptr %a, align 4
  %xor = xor i32 %or, %7
  %8 = load i32, ptr %x.addr, align 4
  %add8 = add i32 %8, 71
  %and9 = and i32 %xor, %add8
  store i32 %and9, ptr %t2, align 4
  %9 = load i32, ptr %b, align 4
  %10 = load i32, ptr %c, align 4
  %or10 = or i32 %9, %10
  %11 = load i32, ptr %b, align 4
  %xor11 = xor i32 %or10, %11
  %12 = load i32, ptr %x.addr, align 4
  %sub12 = sub i32 %12, 4
  %and13 = and i32 %xor11, %sub12
  store i32 %and13, ptr %t3, align 4
  %13 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %13, 62
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %xor17 = xor i32 %shr16, 255
  %and18 = and i32 %xor17, 45
  store i32 %and18, ptr %t4, align 4
  %14 = load i32, ptr %x.addr, align 4
  %xor19 = xor i32 %14, 63
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %xor22 = xor i32 %shr21, 255
  %and23 = and i32 %xor22, 95
  store i32 %and23, ptr %t5, align 4
  %15 = load i32, ptr %t1, align 4
  %16 = load i32, ptr %t2, align 4
  %or24 = or i32 %15, %16
  %17 = load i32, ptr %t3, align 4
  %or25 = or i32 %or24, %17
  %18 = load i32, ptr %t4, align 4
  %or26 = or i32 %or25, %18
  %19 = load i32, ptr %t5, align 4
  %or27 = or i32 %or26, %19
  ret i32 %or27
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
