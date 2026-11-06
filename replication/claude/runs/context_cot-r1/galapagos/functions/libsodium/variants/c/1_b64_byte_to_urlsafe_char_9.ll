; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.c"
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
  %lower = alloca i32, align 4
  %upper = alloca i32, align 4
  %digit = alloca i32, align 4
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %t4 = alloca i32, align 4
  %t5 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %add = add i32 %0, 65
  store i32 %add, ptr %lower, align 4
  %1 = load i32, ptr %x.addr, align 4
  %add1 = add i32 %1, 71
  store i32 %add1, ptr %upper, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %2, 4
  store i32 %sub, ptr %digit, align 4
  %3 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %3, 26
  %shr = lshr i32 %sub2, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m26, align 4
  %4 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %4, 52
  %shr4 = lshr i32 %sub3, 8
  %and5 = and i32 %shr4, 255
  store i32 %and5, ptr %m52, align 4
  %5 = load i32, ptr %x.addr, align 4
  %sub6 = sub i32 %5, 62
  %shr7 = lshr i32 %sub6, 8
  %and8 = and i32 %shr7, 255
  store i32 %and8, ptr %m62, align 4
  %6 = load i32, ptr %m26, align 4
  %7 = load i32, ptr %lower, align 4
  %and9 = and i32 %6, %7
  store i32 %and9, ptr %t1, align 4
  %8 = load i32, ptr %m26, align 4
  %xor = xor i32 %8, 255
  %9 = load i32, ptr %m52, align 4
  %and10 = and i32 %xor, %9
  %10 = load i32, ptr %upper, align 4
  %and11 = and i32 %and10, %10
  store i32 %and11, ptr %t2, align 4
  %11 = load i32, ptr %m52, align 4
  %xor12 = xor i32 %11, 255
  %12 = load i32, ptr %m62, align 4
  %and13 = and i32 %xor12, %12
  %13 = load i32, ptr %digit, align 4
  %and14 = and i32 %and13, %13
  store i32 %and14, ptr %t3, align 4
  %14 = load i32, ptr %x.addr, align 4
  %xor15 = xor i32 %14, 62
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  %xor19 = xor i32 %and18, 255
  %and20 = and i32 %xor19, 45
  store i32 %and20, ptr %t4, align 4
  %15 = load i32, ptr %x.addr, align 4
  %xor21 = xor i32 %15, 63
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %xor25 = xor i32 %and24, 255
  %and26 = and i32 %xor25, 95
  store i32 %and26, ptr %t5, align 4
  %16 = load i32, ptr %t1, align 4
  %17 = load i32, ptr %t2, align 4
  %or = or i32 %16, %17
  %18 = load i32, ptr %t3, align 4
  %or27 = or i32 %or, %18
  %19 = load i32, ptr %t4, align 4
  %or28 = or i32 %or27, %19
  %20 = load i32, ptr %t5, align 4
  %or29 = or i32 %or28, %20
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
