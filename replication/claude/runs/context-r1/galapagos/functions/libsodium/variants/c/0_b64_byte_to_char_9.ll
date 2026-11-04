; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %e62 = alloca i32, align 4
  %e63 = alloca i32, align 4
  %symbols = alloca i32, align 4
  %digit = alloca i32, align 4
  %lower = alloca i32, align 4
  %upper = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m26, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %m52, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %m62, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %sub10 = sub i32 255, %and9
  store i32 %sub10, ptr %e62, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %sub15 = sub i32 255, %and14
  store i32 %sub15, ptr %e63, align 4
  %5 = load i32, ptr %e62, align 4
  %and16 = and i32 %5, 43
  %6 = load i32, ptr %e63, align 4
  %and17 = and i32 %6, 47
  %or = or i32 %and16, %and17
  store i32 %or, ptr %symbols, align 4
  %7 = load i32, ptr %m52, align 4
  %sub18 = sub i32 255, %7
  %8 = load i32, ptr %m62, align 4
  %and19 = and i32 %sub18, %8
  %9 = load i32, ptr %x.addr, align 4
  %sub20 = sub i32 %9, 4
  %and21 = and i32 %and19, %sub20
  store i32 %and21, ptr %digit, align 4
  %10 = load i32, ptr %m26, align 4
  %sub22 = sub i32 255, %10
  %11 = load i32, ptr %m52, align 4
  %and23 = and i32 %sub22, %11
  %12 = load i32, ptr %x.addr, align 4
  %add = add i32 %12, 71
  %and24 = and i32 %and23, %add
  store i32 %and24, ptr %lower, align 4
  %13 = load i32, ptr %m26, align 4
  %14 = load i32, ptr %x.addr, align 4
  %add25 = add i32 %14, 65
  %and26 = and i32 %13, %add25
  store i32 %and26, ptr %upper, align 4
  %15 = load i32, ptr %symbols, align 4
  %16 = load i32, ptr %digit, align 4
  %or27 = or i32 %15, %16
  %17 = load i32, ptr %lower, align 4
  %or28 = or i32 %or27, %17
  %18 = load i32, ptr %upper, align 4
  %or29 = or i32 %or28, %18
  ret i32 %or29
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
